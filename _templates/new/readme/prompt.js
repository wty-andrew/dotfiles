module.exports = [
  {
    type: 'input',
    name: 'title',
    message: "Project title?",
  },
  {
    type: 'select',
    name: 'type',
    message: 'Choose template',
    choices: ['default', 'minimal'],
  }
]
