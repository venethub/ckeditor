require 'ckeditor/orm/base'

module Ckeditor
  module Orm
    module ActiveRecord
      module AssetBase
        def self.included(base)
          base.send(:include, Base::AssetBase::InstanceMethods)
          base.send(:extend, ClassMethods)
        end

        module ClassMethods
          def self.extended(base)
            base.class_eval do
              self.table_name = "ckeditor_asset_files"

              belongs_to :assetable, :polymorphic => true
            end
          end
        end
      end
    end
  end
end
