# Training Session before HITBSECCONF2021 Edu CTF

Online training session for teams that have never participated in Attack & Defence CTF. During that training students will practise the contest concepts and rules, working with vulnerable images, finding services, checksystem interface, game infrastructure, flag submission etc. Participants will be able to practice your skills: set up a real CTF vulnerable image, research services on it, find vulnerability and write an exploit.

Training Session is held on August 14-15th, 2021, approximately 4-5 hours per day.

Made by awesome guys from CTF.ae community.

# Repository structure

1. `vpn/` — VPN configs for orginizers and teams. Should be sent to registered team the day before the training session (by @andgein).
    Organizers can pick a random VPN config with id between 700 and 800 to connect to VPN. Server infrastructure is ready already.
    
    To connect to the VPN: `openvpn vpn/<selected_id>.conf`. You should be able to `ping 10.80.0.1` after connecting.

    Organizers VPN configs list:
    
| Config   | Nickname |
|----------|----------|
| 723.conf | @andgein |
| 750.conf | @midodany11 |
| 760.conf | @deadpackets |

2. `services/` — Services for training session. For now it contains services proposed by @andgein. Feel free to add new ones.

3. `vuln_image/` — Packer configuration for vulnerable image. Image is created as Digital Ocean snapshot.

4. `checksystem/` — Hackerdom CTF checking system for Attack-Defence CTF. Added as a git submodule. Use `git submodule init` and `git submodule update` to checkout it.

5. `ansible/` — Ansible configuration for checksystem.
