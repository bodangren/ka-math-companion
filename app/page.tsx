export default function HomePage() {
  return (
    <section className="stack gap-lg">
      <p className="lead">
        This sprint focuses on standing up the static shell. Future stories will
        load curriculum data, render lessons, and plug in practice generators.
      </p>
      <div className="card">
        <h2 className="card-title">Sprint 1 focus</h2>
        <ul className="card-list">
          <li>Verify static export from Next.js 15 App Router</li>
          <li>Establish shared typography and layout primitives</li>
          <li>Prepare hooks for curriculum content and MDX lessons</li>
        </ul>
      </div>
      <aside className="note" aria-label="Implementation note">
        <strong>Heads up:</strong> content pages and practice generators will land
        in upcoming stories.
      </aside>
    </section>
  );
}
