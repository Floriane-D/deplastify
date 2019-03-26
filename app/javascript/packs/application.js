import "bootstrap";
import "results";
import "home";

import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';

import { initAutocomplete } from '../plugins/init_autocomplete';

initAutocomplete();
initMapbox();
