import Link from "next/link";

export default function HomePage() {
  return (
    <section className="stack gap-lg">
      <header className="stack gap-sm hero">
        <p className="eyebrow">KA Math Companion</p>
        <h1 className="hero-title">
          Master Khan Academy math with structured lessons, generators, and spaced recall.
        </h1>
        <p className="lead hero-lead">
          We curate integrated high school math curricula, then layer in interactive practice and retrieval plans so every learner can progress with confidence.
        </p>
        <div className="hero-actions">
          <Link className="button" href="/curriculum">
            Browse curricula
          </Link>
          <Link className="text-link" href="/curriculum/integrated-math-3">
            Jump into Integrated Math 3
          </Link>
        </div>
      </header>

      <div className="card">
        <h2 className="card-title">What you’ll find here</h2>
        <ul className="card-list">
          <li>Unit-by-unit overviews synced to Khan Academy course exports.</li>
          <li>Deterministic practice generators aligned to each lesson objective.</li>
          <li>Spaced retrieval flashcards and scaffolds to reinforce mastery.</li>
        </ul>
      </div>

      <aside className="note" aria-label="Roadmap note">
        Upcoming sprints add lesson narratives, adaptive practice feedback, and automatic spaced review scheduling.
      </aside>
    </section>
  );
}
