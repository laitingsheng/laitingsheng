set -a
for _f in .envs/*; do
    . "$_f"
done
unset _f
set +a
