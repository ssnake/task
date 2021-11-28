# frozen_string_literal: true

bearer = Bearer.find_or_create_by name: 'test_bearer'
stock1 = Stock.find_or_create_by name: 'test_stock_1'
stock2 = Stock.find_or_create_by name: 'test_stock_2'
Stock.find_or_create_by name: 'test_stock_3'
BearerStockAssociation.find_or_create_by bearer: bearer, stock: stock1
BearerStockAssociation.find_or_create_by bearer: bearer, stock: stock2
