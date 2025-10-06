for _f in ~/.envs/*; do
    set -a
    . "$_f"
    set +a
done
