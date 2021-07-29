import_if_available(Ecto.Query)
import_if_available(Ecto.Changeset)

IEx.configure(
  inspect: [
    limit: :infinity,
    charlists: :as_lists,
    pretty: true,
    binaries: :as_strings,
    printable_limit: :infinity
  ]
)
