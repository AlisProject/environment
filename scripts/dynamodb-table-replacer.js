/**
 * DynamoDB の初期セットアップ用の置き換えスクリプト
 * aws dynamodb list-tables |grep ${ALIS_APP_ID}database |sort |tr -d ' ",' | node ./scripts/template-replacer.js
 */
const fs = require('fs')
const path = require('path')
const file = fs.readFileSync(path.join(__dirname, '../template.yaml'), 'utf8')
const replaces = fs.readFileSync('/dev/stdin', 'utf8').split('\n')

let result = file

if (!replaces.length) {
  console.error('Error: missing replace list')
  process.exit(1)
}

try {
  replaces.forEach((replaceItem) => {
    if (!replaceItem) return
    const [prefix, contentName, uid] = replaceItem.split('-')
    const regExp = new RegExp(`xxxxxdatabase-${contentName}-([A-Z0-9]+)`)
    result = result.replace(regExp, replaceItem)
  })
  fs.writeFileSync(path.join(__dirname, '../template.yaml'), result)
  console.log('Replace complete!')
} catch (e) {
  fs.writeFileSync(path.join(__dirname, '../template.yaml'), file)
  console.error('Error: replace failure')
}
