LearningSFDevAPI.Message msg = new LearningSFDevAPI.Message();

//msg.body= 'Excellent book! I am going through all chapters executing the example code.  It is a review of my work on Trailhead.  It is the precursor to my Cloud Code Academy training.';
msg.body= 'Excellent book!';
msg.sender = 'Conrad Monreal';
msg.email = 'conrad.monreal@outlook.com';
msg.location = 'Clovis, CA USA';
msg.test = true;

LearningSFDevAPI.sendMessage(msg);
