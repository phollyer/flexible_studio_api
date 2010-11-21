require 'builder/lib/builder/file_paths'
require 'builder/lib/builder/reg_exp'
require 'builder/lib/builder/utils'

include Builder::FilePaths
include Builder::RegExp
include Builder::Utils

module Builder
  module Init

    attr_accessor :class_dir, :class_file_path,
                  :event_class_file_path, :event_class_name, :event_name, :event_const, :event_file_path,
                  :kernel_file_path,
                  :method_dir, :method_file_path

    def init_class class_name
      @class_dir = swap_initial(class_name)
      @class_file_path = get_class_file_path class_name
    end

    def init_event_class class_name
      @event_class_name = class_name + "Event"
      @event_class_file_path = get_event_class_file_path @event_class_name
    end

    def init_event method_name
      @event_name = method_name + "Event"
      @event_const = convert_prop_to_event @event_name
      @event_file_path = get_event_file_path @event_name
    end

    def init_kernel
      @kernel_file_path = get_kernel_path
    end

    def init_method method_name
      if method_name.match(method_notifier_reg_exp)
        @method_dir = "notifiers"
      else
        @method_dir = swap_initial(method_name)
      end
      @method_file_path = get_method_file_path method_name
    end
  end
end