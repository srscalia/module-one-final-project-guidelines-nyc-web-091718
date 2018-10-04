class AddOverviewParagraphTotalStudentsAndGraduationRateColumnsToSchools < ActiveRecord::Migration[5.0]
  def change
    add_column  :schools, :overview_paragraph, :string
    add_column  :schools, :graduation_rate, :float
    add_column  :schools, :total_students, :integer
  end
end
