Author: [Thanh Trung Le](https://github.com/lethanhtrung95ee)

Summary: a command-line interface (CLI) Vocabulary Builder application. This project focus on Classes (abstract,
implements), Enums, collections (set, map), control flow, custom operators, handle exception and error, extensions,
functions, generics, mixins, optional.

Detailed explanation:

- Todo CLI application has 5 main functions: `Add`, `Remove`, `Show`, `Update`.
- `Menu screen` will display the instruction to interact with application. Using `Switch-case` and `Enum` to navigate to
  logic layer.
- `Menu` handles presentation the instruction and `Generic` function to handle String and Iterable<String> to display.
- `Repository` handles `CRUD` and `Pagination` features for manipulate the tasks of todolist and using `Singleton` to
  have only TodoRepo during running application.
- `Input` as middleware to receive input from user, validate the input and send to `TodoImpl` to
  implement. `Handle exception error` from input and implement layer throw out.
- `TodoImpl` calls to repo to manipulate the database (CRUD) and visualize the data.
- Using `extension` do parsing `Date` input.
