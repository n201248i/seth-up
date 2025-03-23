import { it } from 'bun:test'

it('test husky', async (done) => {
	throw new Error('test husky error')
	done()
})