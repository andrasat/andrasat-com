// import { createPool } from '@vercel/postgres'
import { verifySignature } from '@vonage/jwt'

interface IIncomingMessage {
  'api-key': string
  msisdn: string
  to: string
  messageId: string
  text: string
  type: string
  keyword: string
  'message-timestamp': string
  timestamp: string
  nonce: string
  concat: string
  'concat-ref': string
  'concat-total': string
  'concat-part': string
  data: string
  udh: string
}

export default defineEventHandler(async (event) => {
  const authorization = getHeader(event, 'Authorization')
  const data = await readBody<IIncomingMessage>(event)

  const token = authorization?.split(' ')[1]
  console.log(authorization)
  console.log(data)

  if (!token) {
    console.warn('Unauthorized: No token')
    return {
      message: 'Unauthorized'
    }
  }

  const verified = verifySignature(token, process.env.VONAGE_SIGNATURE_SECRET!)

  if (!verified) {
    console.warn('Unauthorized: Invalid signature')
    return {
      message: 'Unauthorized'
    }
  }

  if (data['api-key'] !== process.env.API_KEY) {
    console.warn('Unauthorized: Invalid API key')
    return {
      message: 'Unauthorized'
    }
  }

  // const db = createPool({
  //   connectionString: process.env.POSTGRES_URL!
  // })

  // await db.query(`
  //   INSERT INTO
  //     messages (message_id, msisdn, to, text, type, keyword, message_timestamp, timestamp, nonce, concat, concat_ref, concat_total, concat_part, data, udh)
  //   VALUES
  //     (${data.messageId}, ${data.msisdn}, ${data.to}, ${data.text}, ${data.type}, ${data.keyword}, ${data['message-timestamp']}, ${data.timestamp}, ${data.nonce}, ${data.concat}, ${data['concat-ref']}, ${data['concat-total']}, ${data['concat-part']}, ${data.data}, ${data.udh})
  // `)

  return {
    message: 'Webhook received'
  }
})
