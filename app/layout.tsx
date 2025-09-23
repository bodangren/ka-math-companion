import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";

const inter = Inter({ subsets: ["latin"], display: "swap" });

export const metadata: Metadata = {
  title: "KA Math Companion",
  description:
    "Static companion for Khan Academy integrated math with lessons, practice, and spaced retrieval.",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" className={inter.className}>
      <body>
        <div className="app-shell">
          <header className="app-header" role="banner">
            <span className="app-tag">Sprint S1</span>
            <h1 className="app-title">KA Math Companion</h1>
            <p className="app-subtitle">Integrated Math 3 static foundation</p>
          </header>
          <main className="app-main" role="main">
            {children}
          </main>
        </div>
      </body>
    </html>
  );
}
