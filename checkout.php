<?php
include 'conndb.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $items = $_POST['items'];
    $total_price = 0;
    $create_at = date("Y-m-d H:i:s");
    $update_at = $create_at;

    // 計算總價格
    foreach ($items as $item) {
        $p_no = $item['p_no'];
        $quantity = $item['quantity'];

        $sql = "SELECT price FROM products WHERE no = $p_no";
        $result = $conn->query($sql);
        if ($result) {
            $row = $result->fetch_assoc();
            $total_price += $row['price'] * $quantity;
        }
    }

    // 插入訂單資料到 `order` 表
    $sqlOrder = "INSERT INTO `order` (total_price, create_at, updata_at) VALUES ($total_price, '$create_at', '$update_at')";
    if ($conn->query($sqlOrder) === TRUE) {
        // 獲取剛插入的訂單 ID
        $order_id = $conn->insert_id;

        // 插入訂單項目到 `order_item` 表
        foreach ($items as $item) {
            $p_no = $item['p_no'];
            $quantity = $item['quantity'];
            $sqlOrderItem = "INSERT INTO `order_item` (products_id, order_id, quantity) VALUES ($p_no, $order_id, $quantity)";
            $conn->query($sqlOrderItem);
        }

        // 刪除購物車中的商品
        foreach ($items as $item) {
            $p_no = $item['p_no'];
            $sqlDelete = "DELETE FROM car WHERE p_no = $p_no";
            $conn->query($sqlDelete);
        }

        // 返回訂單 ID
        echo $order_id;
    } else {
        echo "Error: " . $conn->error;
    }
}

$conn->close();
?>
