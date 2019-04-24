# TODO is $PWD a robust way of defining paths?

clean:
	# TODO clean env from conda env?
	rm -rf wind_repower_usa/__pycache__/
	rm -rf tests/__pycache__/

run_jupyter:
	PYTHONPATH=${PYTHONPATH}:${PWD} jupyter notebook --ip 0.0.0.0 --no-browser

test: unit_test test_notebooks

unit_test:
	python3 -m pytest -ra --tb=line tests

test_notebooks:
	PYTHONPATH=${PYTHONPATH}:${PWD} jupyter nbconvert --execute notebooks/0*.ipynb --stdout > /dev/null

lint:
	flake8 wind_repower_usa scripts

download_turbines:
	cd data/external/wind_turbines_usa; wget -O uswtdb_v1_3_20190107.csv https://www.sciencebase.gov/catalog/file/get/57bdfd8fe4b03fd6b7df5ff9?f=__disk__17%2Fd8%2Ff9%2F17d8f9c1407c32152e9ee998f5313719b2e9d4d9

download_wind_era5:
	PYTHONPATH=${PYTHONPATH}:${PWD} python3 scripts/download_wind_era5.py

calc_wind_speed:
	PYTHONPATH=${PYTHONPATH}:${PWD} python3 scripts/calc_wind_speed.py

calc_simulated_energy_timeseries:
	PYTHONPATH=${PYTHONPATH}:${PWD} python3 scripts/calc_simulated_energy_timeseries.py

calc_simulated_energy_per_location:
	PYTHONPATH=${PYTHONPATH}:${PWD} python3 scripts/calc_simulated_energy_per_location.py

calc_optimal_locations:
	PYTHONPATH=${PYTHONPATH}:${PWD} python3 scripts/calc_optimal_locations.py

calc_repower_potential:
	PYTHONPATH=${PYTHONPATH}:${PWD} python3 scripts/calc_repower_potential.py

calc_min_distances:
	PYTHONPATH=${PYTHONPATH}:${PWD} python3 scripts/calc_min_distances.py

generate_figures:
	PYTHONPATH=${PYTHONPATH}:${PWD} python3 scripts/generate_figures.py

slides:
	cd doc/slides; pdflatex slides.tex