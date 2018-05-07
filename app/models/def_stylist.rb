class DefStylist < ApplicationRecord
has_and_belongs_to_many :stylists, :join_table => :stylists_def_stylists


belongs_to :resource,
           :polymorphic => true,
           :optional => true


validates :resource_type,
          :inclusion => { :in => Rolify.resource_types },
          :allow_nil => true

scopify
end
