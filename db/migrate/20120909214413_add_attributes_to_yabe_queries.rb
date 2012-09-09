class AddAttributesToYabeQueries < ActiveRecord::Migration
  def change
    add_column :yabe_queries, :rstr1, :string
    add_column :yabe_queries, :rstr2, :string
    add_column :yabe_queries, :rstr3, :string
    add_column :yabe_queries, :rstr4, :string
    add_column :yabe_queries, :rstr5, :string
    add_column :yabe_queries, :rstr6, :string
    add_column :yabe_queries, :rstr7, :string
    add_column :yabe_queries, :rstr8, :string
    add_column :yabe_queries, :rstr9, :string
    add_column :yabe_queries, :rstr10, :string

    add_column :yabe_queries, :rint1, :integer
    add_column :yabe_queries, :rint2, :integer
    add_column :yabe_queries, :rint3, :integer
    add_column :yabe_queries, :rint4, :integer
    add_column :yabe_queries, :rint5, :integer
    add_column :yabe_queries, :rint6, :integer
    add_column :yabe_queries, :rint7, :integer
    add_column :yabe_queries, :rint8, :integer
    add_column :yabe_queries, :rint9, :integer
    add_column :yabe_queries, :rint10, :integer

    add_column :yabe_queries, :rboo1, :boolean
    add_column :yabe_queries, :rboo2, :boolean
    add_column :yabe_queries, :rboo3, :boolean
    add_column :yabe_queries, :rboo4, :boolean
    add_column :yabe_queries, :rboo5, :boolean
    add_column :yabe_queries, :rboo6, :boolean
    add_column :yabe_queries, :rboo7, :boolean
    add_column :yabe_queries, :rboo8, :boolean
    add_column :yabe_queries, :rboo9, :boolean
    add_column :yabe_queries, :rboo10, :boolean

    add_column :yabe_queries, :rflo1, :float
    add_column :yabe_queries, :rflo2, :float
    add_column :yabe_queries, :rflo3, :float
    add_column :yabe_queries, :rflo4, :float
    add_column :yabe_queries, :rflo5, :float
    add_column :yabe_queries, :rflo6, :float
    add_column :yabe_queries, :rflo7, :float
    add_column :yabe_queries, :rflo8, :float
    add_column :yabe_queries, :rflo9, :float
    add_column :yabe_queries, :rflo10, :float

    add_column :yabe_queries, :rdec1, :decimal
    add_column :yabe_queries, :rdec2, :decimal
    add_column :yabe_queries, :rdec3, :decimal
    add_column :yabe_queries, :rdec4, :decimal
    add_column :yabe_queries, :rdec5, :decimal
    add_column :yabe_queries, :rdec6, :decimal
    add_column :yabe_queries, :rdec7, :decimal
    add_column :yabe_queries, :rdec8, :decimal
    add_column :yabe_queries, :rdec9, :decimal
    add_column :yabe_queries, :rdec10, :decimal

    add_column :yabe_queries, :rdat1, :date
    add_column :yabe_queries, :rdat2, :date
    add_column :yabe_queries, :rdat3, :date
    add_column :yabe_queries, :rdat4, :date
    add_column :yabe_queries, :rdat5, :date
    add_column :yabe_queries, :rdat6, :date
    add_column :yabe_queries, :rdat7, :date
    add_column :yabe_queries, :rdat8, :date
    add_column :yabe_queries, :rdat9, :date
    add_column :yabe_queries, :rdat10, :date

    add_column :yabe_queries, :rdti1, :datetime
    add_column :yabe_queries, :rdti2, :datetime
    add_column :yabe_queries, :rdti3, :datetime
    add_column :yabe_queries, :rdti4, :datetime
    add_column :yabe_queries, :rdti5, :datetime
    add_column :yabe_queries, :rdti6, :datetime
    add_column :yabe_queries, :rdti7, :datetime
    add_column :yabe_queries, :rdti8, :datetime
    add_column :yabe_queries, :rdti9, :datetime
    add_column :yabe_queries, :rdti10, :datetime

    add_column :yabe_queries, :rtim1, :time
    add_column :yabe_queries, :rtim2, :time
    add_column :yabe_queries, :rtim3, :time
    add_column :yabe_queries, :rtim4, :time
    add_column :yabe_queries, :rtim5, :time
    add_column :yabe_queries, :rtim6, :time
    add_column :yabe_queries, :rtim7, :time
    add_column :yabe_queries, :rtim8, :time
    add_column :yabe_queries, :rtim9, :time
    add_column :yabe_queries, :rtim10, :time

  end
end
