class CreateApplies < ActiveRecord::Migration[5.0]
  def change
    create_table :applies do |t|
      t.string :student_id,           null: false, default: "" #학번
      t.string :name,                 null: false, default: "" #이름
      t.string :department,           null: false, default: "" #학과
      t.string :contact,              null: false, default: ""  #연락처
      t.string :nonuser_email,        null: false, default: "" #이메일
      t.string :question1_radio,      null: false, default: ""
      t.string :question2_radio,      null: false, default: ""
      t.string :question3_radio,      null: false, default: ""
      t.string :question4_radio,      null: false, default: ""
      t.string :question1_str,        null: false, default: ""
      t.string :question2_str,        null: false, default: ""
      t.string :question3_str,        null: false, default: ""
      t.string :question4_str
      t.string :question5_str
      t.string :last_word

      t.timestamps
    end
  end
end
