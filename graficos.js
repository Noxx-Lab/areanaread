document.addEventListener("DOMContentLoaded", function () {
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
});
