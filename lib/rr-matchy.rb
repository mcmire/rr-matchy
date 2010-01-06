require 'rr'
require 'matchy'

module RRMatchy
  custom_matcher :have_received do |subject, matcher, args|
    proxy = RR::SpyVerificationProxy.new(subject)
    verification = nil
    if args[0]
      # subject.should have_received(:foo)
      verification = proxy.method_missing(args[0])
    else
      # subject.should have_received.foo(1)
      first_msg = matcher.chained_messages.shift
      verification = proxy.method_missing(first_msg.name, *first_msg.args, &first_msg.block)
      for msg in matcher.chained_messages
        # subject.should have_received.foo(1).once
        verification.send(msg.name, *msg.args, &msg.block)
      end
    end
    calls = RR::Space.instance.recorded_calls
    if error = calls.match_error(verification)
      matcher.positive_failure_message = error.message
      false
    else
      true
    end
  end
end