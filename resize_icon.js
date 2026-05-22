const sharp = require('sharp');
const path = require('path');
const fs = require('fs');

const sourceIcon = process.argv[2];
const resDir = process.argv[3];

const sizes = {
  'mipmap-mdpi': 48,
  'mipmap-hdpi': 72,
  'mipmap-xhdpi': 96,
  'mipmap-xxhdpi': 144,
  'mipmap-xxxhdpi': 192,
};

async function resize() {
  for (const [folder, size] of Object.entries(sizes)) {
    const outDir = path.join(resDir, folder);
    if (!fs.existsSync(outDir)) fs.mkdirSync(outDir, { recursive: true });
    
    // Regular icon
    await sharp(sourceIcon)
      .resize(size, size)
      .png()
      .toFile(path.join(outDir, 'ic_launcher.png'));
    
    // Round icon (same image, Android handles the masking)
    await sharp(sourceIcon)
      .resize(size, size)
      .png()
      .toFile(path.join(outDir, 'ic_launcher_round.png'));
    
    console.log(`Created ${size}x${size} icons in ${folder}`);
  }
  
  // Also create foreground for adaptive icon (108dp with padding)
  for (const [folder, size] of Object.entries(sizes)) {
    const adaptiveSize = Math.round(size * 108 / 48);
    const outDir = path.join(resDir, folder);
    await sharp(sourceIcon)
      .resize(adaptiveSize, adaptiveSize)
      .png()
      .toFile(path.join(outDir, 'ic_launcher_foreground.png'));
    console.log(`Created ${adaptiveSize}x${adaptiveSize} foreground in ${folder}`);
  }
  
  console.log('Done!');
}

resize().catch(console.error);
