class CreateEnderecos < ActiveRecord::Migration[5.2]
  def change
    create_table :enderecos do |t|
      t.references :cliente, foreign_key: true
      t.integer :cep
      t.string :rua
      t.string :numero
      t.string :bairro
      t.string :complemento
      t.string :cidade
      t.string :estado     

      t.timestamps
    end
  end
end
