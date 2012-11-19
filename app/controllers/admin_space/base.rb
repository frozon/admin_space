module AdminSpace
  class Base < ::ApplicationController
    def self.managed_by_admin_space(base)
      before_filter :load_resource, only: [:show, :edit, :update, :destroy]
      include InstanceMethods

      layout 'admin_space'
    end

    module InstanceMethods
      def index
        @resources = resource_class.all
      end

      def show
      end

      def edit
      end

      def update
        @resource.update_attributes params[resource_class.to_s.downcase]
        redirect_to [:admin, @resource]
      end

      def new
        @resource = resource_class.new
      end

      def create
        @resource = resource_class.new params[resource_name]
        if @resource.save
          redirect_to [:admin, @resource]
        else
          render action: :new
        end
      end

      def destroy
        @resource.destroy
        redirect_to [:admin, resource_class.to_s]
      end

      protected

      def resource_name
        @resource_name ||= resource_name_from_path
      end

      def resource_name_from_path
        params.include?(:type) ? params[:type].singularize : request.fullpath.underscore.split('/')[2].singularize
      end

      def resource_class
        @resource_class ||= resource_name.to_s.classify.constantize
      end

      # Resources

      def resource_collection
        instance_variable_get("@#{resource_name.to_s.pluralize}") || []
      end

      def resource
        instance_variable_get "@#{resource_name.to_s}"
      end

      def check_model
        @model = params.include?('type') ? params[:type].classify.constantize : controller_name
      end

      def get_model
        params[:type]
      end

      def load_resource
        @resource = resource_class.find(params[:id])
      end
    end

    managed_by_admin_space(self)
  end
end