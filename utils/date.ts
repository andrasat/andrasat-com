const MONTHS = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
]

function formatDate (date: Date) {
  const year = date.getFullYear()
  const month = MONTHS[date.getMonth()]

  return `${month} ${year}`
}

export { formatDate }
