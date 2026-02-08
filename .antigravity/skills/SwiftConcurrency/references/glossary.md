# Glossary

- **Actor isolation**: Ensuring state is only accessible from within the actor.
- **Global actor**: A singleton actor (like @MainActor) used for specific isolation domains.
- **Strict concurrency checking**: Compiler enforcement levels for data-race safety.
- **Sendable**: A marker protocol for types that can safely cross isolation boundaries.
- **Suspension point**: An `await` where a task may pause.
- **Reentrancy**: The ability of an actor to process other tasks while one task is suspended.
- **Structured concurrency**: Concurrency with clear parent-child relationships (`async let`, Task Groups).
- **Executor**: The mechanism that decides how and where tasks are executed.
- **Task Priority**: A hint to the system about the importance of a task.
- **Task Local**: Values that are available within a task's scope and passed to child tasks.
- **Continuation**: A bridge between closure-based code and async/await.
