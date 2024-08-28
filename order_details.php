<?php
include 'conndb.php';

$order_id = $_GET['order_id'];

// 查詢訂單基本信息
$sqlOrder = "SELECT * FROM `order` WHERE order_id = $order_id";
$resultOrder = $conn->query($sqlOrder);
$order = $resultOrder->fetch_assoc();

// 查詢訂單項目信息
$sqlItems = "SELECT oi.quantity, p.name, p.price FROM `order_item` oi
             JOIN products p ON oi.products_id = p.no
             WHERE oi.order_id = $order_id";
$resultItems = $conn->query($sqlItems);

$conn->close();
?>

<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>訂單詳情</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>訂單編號：<?php echo $order['order_id']; ?></h1>
    <p>成立時間：<?php echo $order['create_at']; ?></p>
    <p>總價格：<?php echo $order['total_price']; ?> 元</p>

    <h2>商品詳細內容</h2>
    <table border="1">
        <thead>
            <tr>
                <th>商品名稱</th>
                <th>單價</th>
                <th>數量</th>
                <th>總價</th>
            </tr>
        </thead>
        <tbody>
            <?php while($item = $resultItems->fetch_assoc()): ?>
                <tr>
                    <td><?php echo $item['name']; ?></td>
                    <td><?php echo $item['price']; ?> 元</td>
                    <td><?php echo $item['quantity']; ?></td>
                    <td><?php echo $item['price'] * $item['quantity']; ?> 元</td>
                </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
</body>
</html>
