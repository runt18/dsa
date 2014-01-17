assert = require 'assert'

{Man, Woman, gale_shapley} = require '../src/gale_shapley'

describe 'Gale-Shapley stable matching', ->
    alan = new Man('Alan')
    bill = new Man('Bill')
    carl = new Man('Carl')

    debbie = new Woman('Debbie')
    elena = new Woman('Elena')
    freida = new Woman('Freida')

    alan.preferences = [debbie, elena, freida]
    bill.preferences = [elena, debbie, freida]
    carl.preferences = [debbie, freida, elena]

    debbie.preferences = [carl, alan, bill]
    elena.preferences = [alan, bill, carl]
    freida.preferences = [alan, carl, bill]

    men = [alan, bill, carl]

    gale_shapley(men)

    it 'should correctly match the men and women', ->
        assert.equal(carl.match, debbie)
