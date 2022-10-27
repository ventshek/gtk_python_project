
test_fn () {
    df -h | grep "/dev/sda3" | awk '{print $5}'
}

if ((test_fn > 50)) 
then
    echo "green"
else 
    echo "red"
fi