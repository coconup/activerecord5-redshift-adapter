require "cases/helper"

class SqlTypesTest < ActiveRecord::TestCase
  def test_binary_types
    assert_equal 'bytea', type_to_sql(:binary, limit: 100_000)
    assert_raise ActiveRecord::ActiveRecordError do
      type_to_sql :binary, 4294967295
    end
    assert_equal 'text', type_to_sql(:text, limit: 100_000)
    assert_raise ActiveRecord::ActiveRecordError do
      type_to_sql :text, 4294967295
    end
  end

  def type_to_sql(*args, **named_args)
    ActiveRecord::Base.connection.type_to_sql(*args, **named_args)
  end
end
