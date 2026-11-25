Because ApiKeyRejection::MissingAPIKey is an enum variant with no data attached, .ok_or() is zero-cost. However, if constructing the error requires allocating memory (like format!() or .to_string()), use .ok_or_else(|| ...) instead so the error is only created when the value is actually None.

# Option<T> -> Some(T) or None
# Result<T, E> -> Ok(T) or Err(E)
# ? unwrap to Ok or Back to caller passing E.

