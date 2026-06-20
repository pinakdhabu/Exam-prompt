const ok = value => ({ ok: true, value });
const err = error => ({ ok: false, error });

function tryCatch(fn) {
  try {
    const value = fn();
    return ok(value);
  } catch (error) {
    return err(error);
  }
}

async function tryCatchAsync(fn) {
  try {
    const value = await fn();
    return ok(value);
  } catch (error) {
    return err(error);
  }
}

module.exports = { ok, err, tryCatch, tryCatchAsync };
