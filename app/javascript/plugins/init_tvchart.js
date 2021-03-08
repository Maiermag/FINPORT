import { createChart } from 'lightweight-charts';

const initTvChart = () => {
  function createSimpleSwitcher(items, activeItem, activeItemChangedCallback) {
    var switcherElement = document.querySelector('#tv-chart');
    switcherElement.classList.add('switcher');

    var intervalElements = items.map(function(item) {
      var itemEl = document.createElement('button');
      itemEl.innerText = item;
      itemEl.classList.add('switcher-item');
      itemEl.classList.toggle('switcher-active-item', item === activeItem);
      itemEl.addEventListener('click', function() {
        onItemClicked(item);
      });
      switcherElement.appendChild(itemEl);
      return itemEl;
    });

    function onItemClicked(item) {
      if (item === activeItem) {
        return;
      }

      intervalElements.forEach(function(element, index) {
        element.classList.toggle('switcher-active-item', items[index] === item);
      });

      activeItem = item;

      activeItemChangedCallback(item);
    }

    return switcherElement;
  }

  var intervals = ['1D', '1W', '1M', '1Y'];


  var dayData = JSON.parse(document.querySelector('#tv-chart').dataset.day);
  var weekData = JSON.parse(document.querySelector('#tv-chart').dataset.week);
  var monthData = JSON.parse(document.querySelector('#tv-chart').dataset.month);
  var yearData = JSON.parse(document.querySelector('#tv-chart').dataset.year);

  

  var seriesesData = new Map([
    ['1D', dayData ],
    ['1W', weekData ],
    ['1M', monthData ],
    ['1Y', yearData ],
  ]);
  
  var switcherElement = createSimpleSwitcher(intervals, intervals[0], syncToInterval);

  var chartElement = document.querySelector('#tv-chart');

  var chart = createChart(chartElement, {
    width: 300,
    height: 200,
   
    layout: {
      backgroundColor: '#E0E0E0',
      textColor: '#131B23',
    },
    grid: {
      vertLines: {
        visible: false,
      },
      horzLines: {
        color: 'rgba(42, 46, 57, 0.5)',
      },
    },
    rightPriceScale: {
      borderVisible: false,
    },
    timeScale: {
      borderVisible: false,
    },
    crosshair: {
      horzLine: {
        visible: false,
      },
    },
  });

  // document.body.appendChild(chartElement);
  // document.body.appendChild(switcherElement);

  var areaSeries = null;

  function syncToInterval(interval) {
    if (areaSeries) {
      chart.removeSeries(areaSeries);
      areaSeries = null;
    }
    areaSeries = chart.addAreaSeries({
      topColor: 'rgba(98, 121, 184, 0.56)',
      bottomColor: 'rgba(98, 121, 184, 0.04)',
      lineColor: 'rgba(98, 121, 184, 1)',
      lineWidth: 2,
    });
    areaSeries.setData(seriesesData.get(interval));
  }

  syncToInterval(intervals[0]);
};

export { initTvChart };
199, 109,126