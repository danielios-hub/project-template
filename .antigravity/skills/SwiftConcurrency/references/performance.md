# Performance

## Core Principles
- **Measurement is essential**: Use Instruments for concurrency profiling.
- **Avoid blocking**: Never use semaphores or locks on the cooperative thread pool.

## Common Issues
- **UI Hangs**: Blocking the main actor with heavy work.
- **Actor Contention**: Too many tasks waiting for the same actor.
- **Excessive Context Switching**: Too many `await` points in high-performance loops.

## Using Xcode Instruments
Use the **Swift Concurrency** template to see Task states, Actor usage, and potential deadlocks.

## Reducing Suspensions
- Use synchronous methods for internal actor work.
- Inherit isolation where possible to avoid hops.
- Group actor-isolated state to minimize access points.

## UX-Driven Decisions
Smooth animations and responsiveness are often more important than raw speed. Use Task Priorities to guide the system.

## Optimization Checklist
- [x] Heavy work moved to background tasks.
- [x] Reduced unnecessary actor hops.
- [x] Parallelized independent work using `async let` or `TaskGroup`.
