# [Windows Event ID 4624, 4625, 4672, 4688, 4698, 4720, 4725, 4726 Log List]

## Attack Chain
The 4 cases are linked as a single coordinated attack:

Initial Access        Execution             Persistence            Impact
4625 x6          →    4688                → 4720                 → 4723
(Brute Force)         (Encoded PS)          (New Account)           (Password Change)
     ↓                                           ↓                       ↓
4740                                        4732                    4724
(Lockout)                                   (Admin Group)           (Force Reset)
     ↓                                           ↓                       ↓
4624                                        4698                    4725
(Success Login)                             (Scheduled Task)        (Disable)
                                                                        ↓
                                                                    4726
                                                                    (Delete)

<img width="1022" height="768" alt="image" src="https://github.com/user-attachments/assets/ec6da24b-e1b0-4b1b-8ea3-5ce1525794a1" />
<img width="791" height="545" alt="image" src="https://github.com/user-attachments/assets/fa696df8-7c84-4d85-931a-a8345d21e414" />
<img width="471" height="587" alt="image" src="https://github.com/user-attachments/assets/df595f91-6a79-41b5-a673-a8b0452339ec" />
<img width="1000" height="648" alt="image" src="https://github.com/user-attachments/assets/81b9ddd4-1f68-4844-9bf6-c49acc0744dd" />
<img width="1022" height="718" alt="image" src="https://github.com/user-attachments/assets/3149fcda-2ee2-41f0-9ea8-0cb845e395bb" />
<img width="602" height="556" alt="image" src="https://github.com/user-attachments/assets/8d268fe8-5cdb-467e-b684-d48ebb301233" />
<img width="764" height="587" alt="Screenshot 2026-03-06 223343" src="https://github.com/user-attachments/assets/7b4faec1-ffd8-4a96-bf30-071d56181443" />
<img width="1022" height="727" alt="image" src="https://github.com/user-attachments/assets/34ac943e-9dd9-4b5c-8c4a-ad91dadfc256" />
<img width="1020" height="722" alt="image" src="https://github.com/user-attachments/assets/31be378e-8016-4973-9d85-c1f798763a92" />




