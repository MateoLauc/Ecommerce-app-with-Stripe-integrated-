# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

roles = Role.create(naziv: 'Regular User ')
categories= Category.create(name: 'DJECJA ODJEĆA' ,vrsta: 'Ljetna' )
categories= Category.create(name: 'ZENSKA ODJEĆA' ,vrsta: 'Zimska' )
categories= Category.create(name: 'SPORTSKA odjeća' ,vrsta: 'Ljetna' )