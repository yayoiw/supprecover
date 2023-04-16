# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Supplement.create(name:"マグネシウム",description:"マグネシウムには動脈を拡張させる作用があり、血圧を降下させる作用があると言われています。")
Supplement.create(name:"カリウム",description:"カリウムには体内の余分なナトリウムを排出する作用があり、高血圧予防に役立つと言われています。")
Supplement.create(name:"コエンザイムQ10",description:"コエンザイムQ10は継続的に服用することで高血圧予防効果があると言われています。")
Supplement.create(name:"ビタミンB12",description:"ビタミンB12不足が低血圧の原因の一つである場合があります。")
Supplement.create(name:"鉄",description:"鉄欠乏性貧血は低血圧の原因の一つである可能性があります。")
Supplement.create(name:"ナイアシン",description:"ナイアシンは総コレステロール値を下げる働きがあると言われています。")
Supplement.create(name:"オメガ3脂肪酸",description:"オメガ3脂肪酸には高血圧のリスク減少、総コレステロール値、LDLコレステロール値、HDLコレステロール値、中性脂肪を改善する作用が報告されています。")
Supplement.create(name:"カテキン",description:"カテキンには総コレステロール値、中性脂肪を下げる効果があると言われています。")
Supplement.create(name:"紅麹",description:"紅麹には総コレステロール値とLDLコレステロール値を下げる効果があると言われています。")
Supplement.create(name:"プロポリス",description:"プロポリスには抗炎症作用や総コレステロール値の改善可能性があります。")
Supplement.create(name:"N-アセチルシステイン",description:"NACは、グルタチオンという抗酸化物質の生成をサポートし、肝臓のデトックス作用を強化するとされています。AST、ALT、γ-gtpの改善可能性があります。")
Supplement.create(name:"シリマリン",description:"シリマリンは肝臓を保護、再生することで知られており、シリマリンという成分が特に肝臓の機能をサポートすると言われています。AST、ALT、γ-gtpの改善可能性があります。")
Supplement.create(name:"オルニチン",description:"オルニチンはアミノ酸の一種であり、アンモニアの解毒作用があります。オルニチンは肝臓の解毒作用を助け、肝機能を改善するとされており、γ-GTP値の低下に寄与する可能性があります。")
Supplement.create(name:"タウリン",description:"タウリンは抗酸化作用や抗炎症作用があり、肝臓のデトックス作用をサポートするとされています。γ-GTP値の低下に寄与する可能性があります。")
Supplement.create(name:"ターメリック",description:"ターメリックに含まれるクルクミンは、抗酸化作用や抗炎症作用があり、肝臓の健康をサポートすることが報告されています。AST、ALT、γ-gtpの改善可能性があります。")
Supplement.create(name:"緑茶エキス",description:"緑茶エキスは、脂肪の代謝を促進し、体重減少に効果があるとされています。")
Supplement.create(name:"CLA",description:"CLAは脂肪の減少と筋肉の増加を助けると言われています。")
Supplement.create(name:"プロテイン",description:"筋肉の成長と修復を促し、体重増加をサポートするために必要です。ホエイプロテインやプラントベースのプロテインが一般的です。")
Supplement.create(name:"クレアチン",description:"クレアチンは筋肉にエネルギーを供給し、筋肉の成長を助けるとされています。。")
Tag.create(name:"blood_pressure_up", up_or_down:0)
Tag.create(name:"blood_pressure_down", up_or_down:1)
Tag.create(name:"total_cholesterol", up_or_down:0)
Tag.create(name:"hdl_cholesterol", up_or_down:0)
Tag.create(name:"ldl_cholesterol", up_or_down:0)
Tag.create(name:"neutral_fat", up_or_down:0)
Tag.create(name:"ast", up_or_down:0)
Tag.create(name:"alt", up_or_down:0)
Tag.create(name:"gamma_gtp", up_or_down:0)
Tag.create(name:"weight", up_or_down:0)
Tag.create(name:"weight", up_or_down:1)
SupplementTag.create(supplement_id:"1", tag_id:"1")
SupplementTag.create(supplement_id:"2", tag_id:"1")
SupplementTag.create(supplement_id:"3", tag_id:"1")
SupplementTag.create(supplement_id:"4", tag_id:"2")
SupplementTag.create(supplement_id:"5", tag_id:"2")
SupplementTag.create(supplement_id:"6", tag_id:"3")
SupplementTag.create(supplement_id:"7", tag_id:"1")
SupplementTag.create(supplement_id:"7", tag_id:"3")
SupplementTag.create(supplement_id:"7", tag_id:"4")
SupplementTag.create(supplement_id:"7", tag_id:"5")
SupplementTag.create(supplement_id:"7", tag_id:"6")
SupplementTag.create(supplement_id:"8", tag_id:"3")
SupplementTag.create(supplement_id:"8", tag_id:"6")
SupplementTag.create(supplement_id:"9", tag_id:"3")
SupplementTag.create(supplement_id:"9", tag_id:"5")
SupplementTag.create(supplement_id:"10", tag_id:"3")
SupplementTag.create(supplement_id:"11", tag_id:"7")
SupplementTag.create(supplement_id:"11", tag_id:"8")
SupplementTag.create(supplement_id:"11", tag_id:"9")
SupplementTag.create(supplement_id:"12", tag_id:"7")
SupplementTag.create(supplement_id:"12", tag_id:"8")
SupplementTag.create(supplement_id:"12", tag_id:"9")
SupplementTag.create(supplement_id:"13", tag_id:"9")
SupplementTag.create(supplement_id:"14", tag_id:"9")
SupplementTag.create(supplement_id:"15", tag_id:"7")
SupplementTag.create(supplement_id:"15", tag_id:"8")
SupplementTag.create(supplement_id:"15", tag_id:"9")
SupplementTag.create(supplement_id:"16", tag_id:"10")
SupplementTag.create(supplement_id:"17", tag_id:"10")
SupplementTag.create(supplement_id:"18", tag_id:"11")
SupplementTag.create(supplement_id:"19", tag_id:"11")