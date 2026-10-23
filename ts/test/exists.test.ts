
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { BucketlistInspirationSDK } from '..'


describe('exists', async () => {

  test('test-mode', () => {
    const testsdk = BucketlistInspirationSDK.test()
    equal(testsdk instanceof BucketlistInspirationSDK, true,
      'BucketlistInspirationSDK.test() must return a client synchronously')
  })

})
