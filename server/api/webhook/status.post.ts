export default defineEventHandler(async (event) => {
  const data = await readBody<any>(event)
  console.log(data)

  return {
    message: 'Status received'
  }
})
