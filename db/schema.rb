# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120705054344) do

  create_table "options", :force => true do |t|
    t.string   "option"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "option_id"
  end

  add_index "options", ["question_id"], :name => "index_options_on_question_id"

  create_table "questions", :force => true do |t|
    t.string   "question"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "multi_check"
  end

  create_table "t_1s", :force => true do |t|
    t.integer  "o_id"
    t.integer  "area"
    t.boolean  "o_0101"
    t.boolean  "o_0102"
    t.boolean  "o_0103"
    t.boolean  "o_0104"
    t.boolean  "o_0201"
    t.boolean  "o_0202"
    t.boolean  "o_0203"
    t.boolean  "o_0204"
    t.boolean  "o_0301"
    t.boolean  "o_0302"
    t.boolean  "o_0303"
    t.boolean  "o_0304"
    t.boolean  "o_0305"
    t.boolean  "o_0306"
    t.boolean  "o_0401"
    t.boolean  "o_0402"
    t.boolean  "o_0403"
    t.boolean  "o_0404"
    t.boolean  "o_0405"
    t.boolean  "o_0501"
    t.boolean  "o_0502"
    t.boolean  "o_0503"
    t.boolean  "o_0504"
    t.boolean  "o_0505"
    t.boolean  "o_0506"
    t.boolean  "o_0601"
    t.boolean  "o_0602"
    t.boolean  "o_0603"
    t.boolean  "o_0604"
    t.boolean  "o_0605"
    t.boolean  "o_0606"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "t_2s", :force => true do |t|
    t.integer  "o_id"
    t.integer  "area"
    t.boolean  "o_0701"
    t.boolean  "o_0702"
    t.boolean  "o_0703"
    t.boolean  "o_0704"
    t.boolean  "o_0705"
    t.boolean  "o_0706"
    t.boolean  "o_0707"
    t.boolean  "o_0801"
    t.boolean  "o_0802"
    t.boolean  "o_0803"
    t.boolean  "o_0804"
    t.boolean  "o_0805"
    t.boolean  "o_0806"
    t.boolean  "o_0807"
    t.boolean  "o_0808"
    t.boolean  "o_0809"
    t.boolean  "o_0810"
    t.boolean  "o_0811"
    t.boolean  "o_0812"
    t.boolean  "o_0813"
    t.boolean  "o_0814"
    t.boolean  "o_0815"
    t.boolean  "o_0816"
    t.boolean  "o_0817"
    t.boolean  "o_0818"
    t.boolean  "o_0819"
    t.boolean  "o_0820"
    t.boolean  "o_0821"
    t.boolean  "o_0822"
    t.boolean  "o_0823"
    t.boolean  "o_0824"
    t.boolean  "o_0825"
    t.boolean  "o_0826"
    t.boolean  "o_0827"
    t.boolean  "o_0828"
    t.boolean  "o_0829"
    t.boolean  "o_0830"
    t.boolean  "o_0831"
    t.boolean  "o_0832"
    t.boolean  "o_0833"
    t.boolean  "o_0834"
    t.boolean  "o_0835"
    t.boolean  "o_0836"
    t.boolean  "o_0837"
    t.boolean  "o_0838"
    t.boolean  "o_0901"
    t.boolean  "o_0902"
    t.boolean  "o_0903"
    t.boolean  "o_0904"
    t.boolean  "o_0905"
    t.boolean  "o_0906"
    t.boolean  "o_0907"
    t.boolean  "o_0908"
    t.boolean  "o_0909"
    t.boolean  "o_0910"
    t.boolean  "o_0911"
    t.boolean  "o_0912"
    t.boolean  "o_1001"
    t.boolean  "o_1002"
    t.boolean  "o_1003"
    t.boolean  "o_1004"
    t.boolean  "o_1005"
    t.boolean  "o_1006"
    t.boolean  "o_1007"
    t.boolean  "o_1008"
    t.boolean  "o_1101"
    t.boolean  "o_1102"
    t.boolean  "o_1103"
    t.boolean  "o_1104"
    t.boolean  "o_1105"
    t.boolean  "o_1106"
    t.boolean  "o_1107"
    t.boolean  "o_1108"
    t.boolean  "o_1201"
    t.boolean  "o_1202"
    t.boolean  "o_1203"
    t.boolean  "o_1204"
    t.boolean  "o_1205"
    t.boolean  "o_1206"
    t.boolean  "o_1207"
    t.boolean  "o_1208"
    t.boolean  "o_1209"
    t.boolean  "o_1210"
    t.boolean  "o_1211"
    t.boolean  "o_1301"
    t.boolean  "o_1302"
    t.boolean  "o_1303"
    t.boolean  "o_1304"
    t.boolean  "o_1305"
    t.boolean  "o_1306"
    t.boolean  "o_1307"
    t.boolean  "o_1308"
    t.boolean  "o_1401"
    t.boolean  "o_1402"
    t.boolean  "o_1403"
    t.boolean  "o_1404"
    t.boolean  "o_1405"
    t.boolean  "o_1406"
    t.boolean  "o_1407"
    t.boolean  "o_1408"
    t.boolean  "o_1409"
    t.boolean  "o_1410"
    t.boolean  "o_1501"
    t.boolean  "o_1502"
    t.boolean  "o_1503"
    t.boolean  "o_1504"
    t.boolean  "o_1505"
    t.boolean  "o_1506"
    t.boolean  "o_1601"
    t.boolean  "o_1602"
    t.boolean  "o_1603"
    t.boolean  "o_1604"
    t.boolean  "o_1605"
    t.boolean  "o_1606"
    t.boolean  "o_1607"
    t.boolean  "o_1608"
    t.boolean  "o_1701"
    t.boolean  "o_1702"
    t.boolean  "o_1703"
    t.boolean  "o_1704"
    t.boolean  "o_1705"
    t.boolean  "o_1706"
    t.boolean  "o_1707"
    t.boolean  "o_1708"
    t.boolean  "o_1709"
    t.boolean  "o_1710"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "t_3s", :force => true do |t|
    t.integer  "o_id"
    t.integer  "area"
    t.boolean  "o_1901"
    t.boolean  "o_1902"
    t.boolean  "o_1903"
    t.boolean  "o_1904"
    t.boolean  "o_1905"
    t.boolean  "o_1906"
    t.boolean  "o_1907"
    t.boolean  "o_2001"
    t.boolean  "o_2002"
    t.boolean  "o_2003"
    t.boolean  "o_2004"
    t.boolean  "o_2005"
    t.boolean  "o_2006"
    t.boolean  "o_2007"
    t.boolean  "o_2008"
    t.boolean  "o_2009"
    t.boolean  "o_2101"
    t.boolean  "o_2102"
    t.boolean  "o_2103"
    t.boolean  "o_2104"
    t.boolean  "o_2105"
    t.boolean  "o_2106"
    t.boolean  "o_2107"
    t.boolean  "o_2108"
    t.boolean  "o_2109"
    t.boolean  "o_2110"
    t.boolean  "o_2201"
    t.boolean  "o_2202"
    t.boolean  "o_2203"
    t.boolean  "o_2204"
    t.boolean  "o_2205"
    t.boolean  "o_2206"
    t.boolean  "o_2207"
    t.boolean  "o_2208"
    t.boolean  "o_2209"
    t.boolean  "o_2210"
    t.boolean  "o_2211"
    t.boolean  "o_2212"
    t.boolean  "o_2213"
    t.boolean  "o_2214"
    t.boolean  "o_2215"
    t.boolean  "o_2216"
    t.boolean  "o_2217"
    t.boolean  "o_2218"
    t.boolean  "o_2219"
    t.boolean  "o_2220"
    t.boolean  "o_2301"
    t.boolean  "o_2302"
    t.boolean  "o_2303"
    t.boolean  "o_2304"
    t.boolean  "o_2305"
    t.boolean  "o_2306"
    t.boolean  "o_2401"
    t.boolean  "o_2402"
    t.boolean  "o_2403"
    t.boolean  "o_2404"
    t.boolean  "o_2501"
    t.boolean  "o_2502"
    t.boolean  "o_2503"
    t.boolean  "o_2504"
    t.boolean  "o_2505"
    t.boolean  "o_2506"
    t.boolean  "o_2507"
    t.boolean  "o_2508"
    t.boolean  "o_2601"
    t.boolean  "o_2602"
    t.boolean  "o_2603"
    t.boolean  "o_2604"
    t.boolean  "o_2605"
    t.boolean  "o_2606"
    t.boolean  "o_2607"
    t.boolean  "o_2608"
    t.boolean  "o_2701"
    t.boolean  "o_2702"
    t.boolean  "o_2703"
    t.boolean  "o_2704"
    t.boolean  "o_2705"
    t.boolean  "o_2706"
    t.boolean  "o_2707"
    t.boolean  "o_2708"
    t.boolean  "o_2709"
    t.boolean  "o_2710"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "o_2221"
  end

  create_table "t_4s", :force => true do |t|
    t.integer  "o_id"
    t.integer  "area"
    t.boolean  "o_2901"
    t.boolean  "o_2902"
    t.boolean  "o_2903"
    t.boolean  "o_2904"
    t.boolean  "o_2905"
    t.boolean  "o_2906"
    t.boolean  "o_2907"
    t.boolean  "o_3001"
    t.boolean  "o_3002"
    t.boolean  "o_3101"
    t.boolean  "o_3102"
    t.boolean  "o_3103"
    t.boolean  "o_3104"
    t.boolean  "o_3105"
    t.boolean  "o_3106"
    t.boolean  "o_3107"
    t.boolean  "o_3108"
    t.boolean  "o_3109"
    t.boolean  "o_3110"
    t.boolean  "o_3111"
    t.boolean  "o_3201"
    t.boolean  "o_3202"
    t.boolean  "o_3203"
    t.boolean  "o_3204"
    t.boolean  "o_3205"
    t.boolean  "o_3206"
    t.boolean  "o_3207"
    t.boolean  "o_3208"
    t.boolean  "o_3209"
    t.boolean  "o_3210"
    t.boolean  "o_3301"
    t.boolean  "o_3302"
    t.boolean  "o_3303"
    t.boolean  "o_3304"
    t.boolean  "o_3305"
    t.boolean  "o_3306"
    t.boolean  "o_3307"
    t.boolean  "o_3308"
    t.boolean  "o_3401"
    t.boolean  "o_3402"
    t.boolean  "o_3403"
    t.boolean  "o_3404"
    t.boolean  "o_3405"
    t.boolean  "o_3406"
    t.boolean  "o_3407"
    t.boolean  "o_3408"
    t.boolean  "o_3501"
    t.boolean  "o_3502"
    t.boolean  "o_3503"
    t.boolean  "o_3504"
    t.boolean  "o_3505"
    t.boolean  "o_3506"
    t.boolean  "o_3507"
    t.boolean  "o_3508"
    t.boolean  "o_3509"
    t.boolean  "o_3601"
    t.boolean  "o_3602"
    t.boolean  "o_3603"
    t.boolean  "o_3604"
    t.boolean  "o_3605"
    t.boolean  "o_3606"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
