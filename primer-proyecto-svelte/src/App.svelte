<script>
  export let name;
  let n1 = 3;
  let n2 = 7;
  let listaCompra = ["leche", "pan", "papel de aluminio", "satélites"];
  let listaCompraFruta = [
    {
      nombre: "fresas",
      cantidad: "1kg",
    },
    { nombre: "manzana", cantidad: "13kg" },
    { nombre: "pera", cantidad: "43kg" },
  ];
  const URL = "https://pokeapi.co/api/v2/pokemon/448";
  const fetchData = (async () => {
    const response = await fetch(URL);
    const data = await response.json();
    return data;
  })();
</script>

<main>
  <h1>Hello {name}!</h1>
  <p>
    Visit the <a href="https://svelte.dev/tutorial">Svelte tutorial</a> to learn
    how to build Svelte apps.
    {#if n1 > n2}
      <p>El primer número es mayor que el segundo</p>
    {:else}
      <p>El segundo número es mayor que el primero</p>
    {/if}
  </p>
  <h2>Mi lista de la comrpa</h2>
  <ul>
    {#each listaCompra as cosa}
      <li>{cosa}</li>
    {/each}
  </ul>
  <h2>Lista de frutas</h2>
  <ul>
    {#each listaCompraFruta as frutas}
      <li>{frutas.nombre + " x " + frutas.cantidad}</li>
    {/each}
  </ul>

  {#await fetchData}
    <p>...cargando</p>
  {:then data}
    <div id="pokemon">
      <div class="card">
        <img
          src={data.sprites.other["official-artwork"].front_default}
          alt=""
        />
        <div class="text">
          <h3>{data.name}</h3>
        </div>
      </div>
    </div>
  {:catch error}
    <p>Error: {error}</p>
  {/await}
</main>

<style>
  main {
    text-align: center;
    padding: 1em;
    max-width: 240px;
    margin: 0 auto;
  }

  h1 {
    color: #ff3e00;
    text-transform: uppercase;
    font-size: 4em;
    font-weight: 100;
  }
  ul {
    list-style: none;
  }

  @media (min-width: 640px) {
    main {
      max-width: none;
    }
  }
  #pokemon {
    max-width: 800px;
    margin: auto;
  }
</style>
