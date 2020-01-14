WHILE (0=0)
BEGIN
    RECEIVE * FROM dbo.QueuePublisher;
    IF (@@ROWCOUNT = 0) BREAK;
END
WHILE (0=0)
BEGIN
    RECEIVE * FROM dbo.QueueConsumerA;
    IF (@@ROWCOUNT = 0) BREAK;
END
WHILE (0=0)
BEGIN
    RECEIVE * FROM dbo.QueueConsumerB;
    IF (@@ROWCOUNT = 0) BREAK;
END
WHILE (0=0)
BEGIN
    RECEIVE * FROM dbo.QueueConsumerC;
    IF (@@ROWCOUNT = 0) BREAK;
END
WHILE (0=0)
BEGIN
    RECEIVE * FROM dbo.QueueConsumerD;
    IF (@@ROWCOUNT = 0) BREAK;
END
WHILE (0=0)
BEGIN
    RECEIVE * FROM dbo.QueueConsumerE;
    IF (@@ROWCOUNT = 0) BREAK;
END
