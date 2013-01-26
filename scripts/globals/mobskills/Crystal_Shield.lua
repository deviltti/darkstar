---------------------------------------------------
-- Crystal Shield
-- Protect II
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

    local power = 40;
    local duration = 300;

    local typeEffect = EFFECT_PROTECT;
    if(target:hasStatusEffect(typeEffect) == true) then
        local effect = target:getStatusEffect(typeEffect);
        local cPower = effect:getPower();
        if(cPower > power) then
            spell:setMsg(75); -- no effect
        else
            target:delStatusEffect(typeEffect);
            target:addStatusEffect(typeEffect,power,0,duration);
        end
    else
        target:addStatusEffect(typeEffect,power,0,duration);
    end
    skill:setMsg(MSG_BUFF);

    return typeEffect;
end;
