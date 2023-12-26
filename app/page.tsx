import Image from 'next/image'
import Link from 'next/link'

export default function Home() {
  return (
    <main>
      <h2>NextAuthjs</h2>
      <Link href="/register">Register</Link>
      <Link href="/login">Login</Link>
    </main>
  )
}
