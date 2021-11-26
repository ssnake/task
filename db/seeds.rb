bearer = Bearer.create_or_find_by name: "test_bearer"
stock_1 = Stock.create_or_find_by name: "test_stock_1", bearer: bearer
stock_2 = Stock.create_or_find_by name: "test_stock_2", bearer: bearer
stock_3 = Stock.create_or_find_by name: "test_stock_3", bearer: bearer