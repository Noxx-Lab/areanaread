document.addEventListener("DOMContentLoaded", function () {
    // --- Gráfico de Capítulos (Bar) ---
    const ctx = document.getElementById('grafico-obras').getContext('2d');
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: Object.keys(obrasPorIntervalo),
            datasets: [{
                label: 'Quantidade de Obras',
                data: Object.values(obrasPorIntervalo),
                backgroundColor: '#ab8df2',
                hoverBackgroundColor: '#e0c2ff',
                borderRadius: 10,
                borderWidth: 1,
            }]
        },
        options: {
            plugins: {
                legend: { display: false },
                tooltip: {
                    backgroundColor: '#4e446a',
                    titleColor: '#fff',
                    bodyColor: '#fff'
                }
            },
            layout: {
                padding: 20
            },
            scales: {
                x: {
                    ticks: { color: "#b8b4d4", font: { weight: "bold" } },
                    grid: { color: "#3e325a" }
                },
                y: {
                    beginAtZero: true,
                    ticks: { color: "#b8b4d4", stepSize: 1 },
                    grid: { color: "#3e325a" }
                }
            }
        }
    });

    // --- Gráfico de Géneros (Donut) ---
    const coresDonut = [
        '#be94f7', '#67d5fa', '#fdca40', '#fd6666', '#6adea5', '#7b6af7', '#fc9e4f',
        '#63b7b7', '#c492b1', '#f47c7c', '#f7d716', '#60efbc', '#ff8882', '#8689b1', '#8cba51'
    ];
    const donutColors = generosLabels.map((_, i) => coresDonut[i % coresDonut.length]);

    if (window.graficoGeneros) window.graficoGeneros.destroy();
    const ctxGeneros = document.getElementById('grafico-generos').getContext('2d');
    window.graficoGeneros = new Chart(ctxGeneros, {
        type: 'doughnut',
        data: {
            labels: generosLabels,
            datasets: [{
                data: generosData,
                backgroundColor: donutColors,
                borderWidth: 2,
                borderColor: '#18171c'
            }]
        },
        options: {
            cutout: '60%',
            plugins: {
                legend: { display: false },
                tooltip: {
                    callbacks: {
                        label: function (context) {
                            // Mostra nome e valor na tooltip
                            let label = context.label || '';
                            let value = context.raw || '';
                            return `${label}: ${value}`;
                        }
                    }
                }
            }
        }
    });

    // Renderiza legendas com cor, nome e valor em baixo do gráfico
    const legenda = document.getElementById('legenda-generos');
    if (legenda) {
        legenda.innerHTML = '';
        generosLabels.forEach((nome, i) => {
            legenda.innerHTML += `
                <div class="legenda-item-genero">
                    <span class="legenda-cor-genero" style="background: ${donutColors[i]}"></span>
                    ${nome} <b>(${generosData[i]})</b>
                </div>
            `;
        });
    }
});
