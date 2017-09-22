module PCPTrace
  def self.setup_kernel(enabled, state = PCPTrace::STATE_NONE)
    Kernel.const_set('PCP_ENABLED', enabled.to_s == "true")
    Kernel.send(:extend, PCPTrace::KernelMethods)
    PCPTrace::state(state)
  end

  module KernelMethods
    def self.extended(mod)
      mod.module_eval do
        def pcp_begin(tag)
          return 0 unless Kernel::PCP_ENABLED
          PCPTrace::begin(tag)
        end

        def pcp_end(tag)
          return 0 unless Kernel::PCP_ENABLED
          PCPTrace::end(tag)
        end

        def pcp_abort(tag)
          return 0 unless Kernel::PCP_ENABLED
          PCPTrace::abort(tag)
        end

        def pcp_measure(tag)
          return 0 unless Kernel::PCP_ENABLED
          PCPTrace::begin(tag)
          result = yield
          PCPTrace::end(tag)
          result
        rescue => e
          PCPTrace::abort(tag)
          raise
        end

        def pcp_point(tag)
          return 0 unless Kernel::PCP_ENABLED
          PCPTrace::point(tag)
        end

        def pcp_counter(tag, value = 1)
          return 0 unless Kernel::PCP_ENABLED
          PCPTrace::counter(tag, value)
        end

        def pcp_observe(tag, value = 1)
          return 0 unless Kernel::PCP_ENABLED
          PCPTrace::obs(tag, value)
        end
      end
    end
  end
end
