# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#   create admin_account

Admin.create!(
    email: 'admin55@admin55',
    password: 'admin55' 
)

Item.create!(
    [
        {
            name: 'ガトーショコラ',
            introduction: 'ガトーは、フランス語でケーキのことですので、チョコレートのケーキということになります。',
            notax_price: '800',
            genre_id: '1'
        },
        {
            name: 'シュークリーム',
            introduction: 'シュー生地を口金から丸く搾り出して焼き、空洞の部分に生クリームやカスタードクリームを詰めたものです。　フランス語で、「シュー・ア・ラ・クレーム」と呼び、「ア・ラ」が省略されて「シュークリーム」と日本語化したようです。英語ではクリームパフといいます。',
            notax_price: '700',
            genre_id: '2'
        }
    ]
)

Genre.create!(
    [
        {name: 'ケーキ'},{name: '洋菓子'},{name: '氷菓子'},{name: 'チョコレート'}
    ]
)