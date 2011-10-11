function fisher = fisher_distribution(m_1,m_2,t)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Berechnet die Fisher-Verteilung mit Freiheitsgraden m_1,m_2 und
%   1-Vertrauensbereich t
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fisher = (m_1/2)^(m_1/2) * (m_2/2)^(m_2/2) * ...
    gamma(m_1/2+m_2/2)/gamma(m_1/2)/gamma(m_2/2) *...
    t^(m_1/2-1) / (m_1*t/2+m_2/2)^(m_1/2+m_2/2);
