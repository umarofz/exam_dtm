import jwt from 'jsonwebtoken'

export default {
    sign: (payload) => jwt.sign(payload, 'olma'),
    verify: (payload) => jwt.verify(payload, 'olma')
}