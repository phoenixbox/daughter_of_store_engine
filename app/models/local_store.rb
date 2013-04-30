class LocalStore
  def self.increase_popularity(thing, user)

    if unique_user?(thing, user)

      key = key(thing.class, :popular)

      REDIS.pipelined do
        set_expiration(key)

        if REDIS.zscore(key, thing.id)
          REDIS.zincrby(key, 1, thing.id)
        else
          REDIS.add(key, thing.id)
        end
      end
    end
  end

  def self.popular(thing)
    key = key(thing, :popular)

    case thing.to_s
    when 'Product' then REDIS.zrevrange(key, 0, 3)
    when 'Store' then set = REDIS.zrevrange(key, 0, 0); set.present? ? set.first : nil
    else nil; end
  end

  def self.unique_user?(thing, user)  
    if visited?(thing, user)
      false
    else
      add_visitor(thing, user)
    end
  end

private

  def self.visited?(thing, user)
    REDIS.sismember("#{thing.class}:#{thing.id}", user) == 1 
  end

  def self.add_visitor(thing, user)

    key = set_item_key(thing)

    if thing.class == Product
      REDIS.sadd(key, user)
    else
      REDIS.sadd(key, user)
      set_expiration(key)
    end
  end

  def self.set_item_key(item)
    "#{item.class}:#{item.id}"
  end

  def self.key(thing, qualifier)
    "#{qualifier}_#{thing.to_s.downcase.pluralize}"
  end

  def self.set_expiration(key)
    REDIS.expire(key, 86400) if REDIS.ttl(key) == -1
  end
end
